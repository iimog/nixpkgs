{ stdenv, fetchurl, pkgconfig
, gettext, gtk2, SDL2, zlib, glib, openal, libGLU_combined, lua, freetype, libmpeg2, zip }:

with stdenv.lib;
stdenv.mkDerivation rec {

  pname = "fs-uae";
  version = "3.0.0";

  src = fetchurl {
    url = "https://fs-uae.net/stable/${version}/${pname}-${version}.tar.gz";
    sha256 = "0r69i6rh472lj4qwqfcfh17xmlw4x6mhqzr9hhpkbb4byyw6h592";
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ gettext gtk2 SDL2 zlib glib openal libGLU_combined lua freetype libmpeg2 zip ];

  meta = {
    description = "An accurate, customizable Amiga Emulator";
    longDescription = ''
      FS-UAE integrates the most accurate Amiga emulation code available
      from WinUAE. FS-UAE emulates A500, A500+, A600, A1200, A1000, A3000
      and A4000 models, but you can tweak the hardware configuration and
      create customized Amigas.
    '';
    license = licenses.gpl2Plus;
    homepage = https://fs-uae.net;
    maintainers = with stdenv.lib; [ maintainers.AndersonTorres ];
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
# TODO: testing and Python GUI support
