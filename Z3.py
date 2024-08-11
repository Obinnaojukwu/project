import z3
import struct
import time

# Get the current time in milliseconds since the Unix epoch
current_time = int(time.time() * 1000)

# Initialize the seeds (states) using the current time
# You can split the time or derive a second state from the time
initial_state0 = current_time & ((1 << 64) - 1)  # Lower 64 bits of the current time
initial_state1 = (current_time >> 32) & ((1 << 64) - 1)  # Upper 64 bits or derived value

# Create Z3 BitVecs with the initial states
se_state0 = z3.BitVecVal(initial_state0, 64)
se_state1 = z3.BitVecVal(initial_state1, 64)

sequence = [
    0.9311600617849973,
    0.3551442693830502,
    0.7923158995678377,
    0.787777942408997,
    0.376372264303491,
    # 0.23137147109312428
]

sequence = sequence[::-1]
solver = z3.Solver()

for i in range(len(sequence)):
    se_s1 = se_state0
    se_s0 = se_state1
    se_state0 = se_s0
    se_s1 ^= se_s1 << 23
    se_s1 ^= z3.LShR(se_s1, 17)
    se_s1 ^= se_s0
    se_s1 ^= z3.LShR(se_s0, 26)
    se_state1 = se_s1

    float_64 = struct.pack("d", sequence[i] + 1)
    u_long_long_64 = struct.unpack("<Q", float_64)[0]

    mantissa = u_long_long_64 & ((1 << 52) - 1)

    solver.add(int(mantissa) == z3.LShR(se_state0, 12))

if solver.check() == z3.sat:
    model = solver.model()
    states = {state.__str__(): model[state] for state in model.decls()}
    print(states)

    state0 = states["se_state0"].as_long()

    u_long_long_64 = (state0 >> 12) | 0x3FF0000000000000
    float_64 = struct.pack("<Q", u_long_long_64)
    next_sequence = struct.unpack("d", float_64)[0]
    next_sequence -= 1

    # Round the predicted number to 2 decimal places
    #next_sequence = round(next_sequence, 2)

    # Convert the number to a string and ensure it is a single number
    # For example, this ensures that a number like 0.030000000000000027 becomes "0.03"
    # next_sequence_str = f"{next_sequence:.2f}"
    #next_sequence = float(next_sequence_str)

    print("Next predicted sequence (rounded to 2 decimal places):", next_sequence)
else:
    print("Solver could not find a solution.")
