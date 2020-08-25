{stdenv, fetchurl, mkDerivation, cmake, libGLU, libGL, qtbase, boost}:

mkDerivation rec {
  version = "202006";
  build_nr = "0";
  pname = "mcrl2";

  src = fetchurl {
    url = "https://www.mcrl2.org/download/release/mcrl2-${version}.${build_nr}.tar.gz";
    sha256 = "167ryrzk1a2j53c2j198jlxa98amcaym070gkcj730619gymv5zl";
  };

  buildInputs = [ cmake libGLU libGL qtbase boost ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "A toolset for model-checking concurrent systems and protocols";
    longDescription = ''
      A formal specification language with an associated toolset,
      that can be used for modelling, validation and verification of
      concurrent systems and protocols
    '';
    homepage = "https://www.mcrl2.org/";
    license = licenses.boost;
    maintainers = with maintainers; [ moretea ];
    platforms = platforms.unix;
  };
}
