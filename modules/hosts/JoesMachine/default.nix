{ self, inputs, ... }: {
  
  flake.nixosConfigurations = {

	  Hyprland = inputs.nixpkgs.lib.nixosSystem {
	    modules = [
	      self.nixosModules.system-packages
	      self.nixosModules.desktop-hyprland
	      self.nixosModules.home-manager
	      self.nixosModules.user-johannes
	      self.nixosModules.JoesMachineConfiguration
	      self.nixosModules.keyboard
	      { johannes.homeProfile = "hyprland"; networking.hostName = "hyprland"; }
	    ];
	  };

	  Gnome = inputs.nixpkgs.lib.nixosSystem {
	  modules = [
	    self.nixosModules.system-packages
	    self.nixosModules.desktop-gnome
	    self.nixosModules.home-manager
	    self.nixosModules.user-johannes
	    self.nixosModules.JoesMachineConfiguration
	    self.nixosModules.keyboard
	    { johannes.homeProfile = "gnome"; networking.hostName = "gnome"; }
	    ];
	};
    };
}
