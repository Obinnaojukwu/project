class Playtation :
    def __init__(self, version, games , controller):
        self.version = version
        self.games = games
        self.controller = controller

    def gaming(self, power):
        print(f"the playstation 5 is very {power}")
        

play1 = Playtation("playstation 4", "red dead redemtion", "green controller")
play2 = Playtation("playstation 1", "GTA 1", "red controller")
print(Playtation.gaming(powerfull))