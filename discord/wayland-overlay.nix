# https://gist.github.com/Strum355/8e0c63d662f297ce23654e763bd4c6af
self: super: {
  discord = super.discord.overrideAttrs (
    _: {
      src = builtins.fetchTarball "https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.tar.gz";
    }
  );
}
