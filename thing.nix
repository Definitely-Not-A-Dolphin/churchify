{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "churchify";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Definitely-Not-A-Dolphin";
    repo = "churchify";
    tag = finalAttrs.version;
    hash = "sha256-gyWnahj1A+iXUQlQ1O1H1u7K5euYQOld9qWm99Vjaeg=";
  };

  cargoHash = "sha256-9atn5qyBDy4P6iUoHFhg+TV6Ur71fiah4oTJbBMeEy4=";

  meta = {
    description = "Encode text Keygen Church-style";
    homepage = "https://github.com/Definitely-Not-A-Dolphin/churchify";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
})
