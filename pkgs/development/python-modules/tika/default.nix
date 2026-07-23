{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pyyaml,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "tika";
  version = "3.1.0";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-TDpATD2EZDfJQtam/Xtx1QKFaQ+uVImqim8A/5zND8c=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyyaml
    requests
  ];

  # Requires network
  doCheck = false;
  pythonImportsCheck = [ "tika" ];

  meta = {
    description = "Python binding to the Apache Tika™ REST services";
    mainProgram = "tika-python";
    homepage = "https://github.com/chrismattmann/tika-python";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ Flakebi ];
  };
})
