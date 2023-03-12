{ stdenv, lib, fetchFromGitHub, meson, ninja, pkg-config, appstream-glib
, wrapGAppsHook, python3Packages, gtk3, gnome, gobject-introspection
, libnotify, libsecret, gst_all_1, shared-mime-info, gdk-pixbuf, libpng, libjpeg, libtiff, rubyPackages}:

python3Packages.buildPythonApplication rec {
  pname = "pithos";
  version = "1.6.0";

  src = fetchFromGitHub {
    owner = pname;
    repo  = pname;
    rev = version;
    hash = "sha256-cFmsdQXfGxgpKe32dw1lgoANU9Drhu5Mecyz37BVP4g=";
  };

  format = "other";

  postPatch = ''
    chmod +x meson_post_install.py
    gdk-pixbuf-query-loaders --update-cache
    patchShebangs meson_post_install.py
  '';

  nativeBuildInputs = [ meson ninja pkg-config appstream-glib wrapGAppsHook gdk-pixbuf shared-mime-info libpng libjpeg libtiff rubyPackages.gio2];

  propagatedNativeBuildInputs = [
    gobject-introspection shared-mime-info gdk-pixbuf libpng libjpeg libtiff
  ];

  propagatedBuildInputs =
    [ gtk3 gobject-introspection libnotify libsecret gnome.adwaita-icon-theme shared-mime-info gdk-pixbuf.dev libpng libjpeg libtiff rubyPackages.gio2 ] ++
    (with gst_all_1; [ gstreamer gst-plugins-base gst-plugins-good gst-plugins-ugly gst-plugins-bad ]) ++
    (with python3Packages; [ pygobject3 pylast ]);

  meta = with lib; {
    broken = stdenv.isDarwin;
    description = "Pandora Internet Radio player for GNOME";
    homepage = "https://pithos.github.io/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ obadz ];
  };
}

