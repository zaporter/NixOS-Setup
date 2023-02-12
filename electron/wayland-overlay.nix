# https://gist.github.com/Strum355/8e0c63d662f297ce23654e763bd4c6af
self:
let
  enableWayland = drv: bin: drv.overrideAttrs (
    old: {
      nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ self.makeWrapper ];
      postFixup = (old.postFixup or "") + ''
        wrapProgram $out/bin/${bin} \
          --add-flags "--enable-features=UseOzonePlatform" \
          --add-flags "--ozone-platform=wayland"
      '';
    }
  );
in
super:
  {
    slack = enableWayland super.slack "slack";
    discord = enableWayland super.discord "discord";
    vscode = enableWayland super.vscode "code";
    google-chrome-beta = (
      super.google-chrome-beta.override {
        commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
      }
    );
  }
