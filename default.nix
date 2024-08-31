{stdenv}:
stdenv.mkDerivation {
  name = "course-class";
  src = ./.;
  installPhase = ''
    mkdir -p $out/tex/latex/custom
    cp course.cls $out/tex/latex/custom/
  '';
  pname = "custom-latex-course-class";
  tlType = "run";
}
