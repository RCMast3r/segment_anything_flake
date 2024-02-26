{ lib, python311Packages, fetchFromGitHub, fetchgit }: 

python311Packages.buildPythonPackage rec {
  pname = "segment_anything";
  version = "1.0.0";
  format="pyproject";
  src_repo = fetchgit {
    url = "https://github.com/facebookresearch/segment-anything.git";
    rev = "6fdee8f2727f4506cfbbe553e23b895e27956588";  # Specify the specific commit, tag, or branch
    sha256 = "sha256-mW3TCYcfTTEVWIFVcvrfBukjKCYZuz7bJy1XBAzbUyI=";  # SHA256 hash of the source
  };

  # Extract the specific subdirectory within the repository
  propagatedBuildInputs = [  python311Packages.setuptools ];
  src = src_repo;  # Adjust the path to your desired subdirectory

  meta = with lib; {
    description = "Description of your package";
    license = licenses.mit;
  };
} 