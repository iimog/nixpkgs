{ stdenv, buildPythonPackage, fetchPypi, isPy27
, backports_ssl_match_hostname
, mock
, paramiko
, pytest
, requests
, six
, websocket_client
}:

buildPythonPackage rec {
  pname = "docker";
  version = "4.1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1hdgics03fz2fbhalzys7a7kjj54jnl5a37h6lzdgym41gkwa1kf";
  };

  propagatedBuildInputs = [
    paramiko
    requests
    six
    websocket_client
  ] ++ stdenv.lib.optional isPy27 backports_ssl_match_hostname;

  checkInputs = [
    mock
    pytest
  ];

  # Other tests touch network
  checkPhase = ''
    ${pytest}/bin/pytest tests/unit/
  '';

  meta = with stdenv.lib; {
    description = "An API client for docker written in Python";
    homepage = "https://github.com/docker/docker-py";
    license = licenses.asl20;
    maintainers = with maintainers; [ jonringer ];
  };
}
