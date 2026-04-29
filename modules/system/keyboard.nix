{... }: {

flake.nixosModules.keyboard = {pkgs, lib, ...}: {
	console.useXkbConfig = true;
	services.xserver.xkb = {
		layout = "dk";
		variant = "mac";
	};
};
}
