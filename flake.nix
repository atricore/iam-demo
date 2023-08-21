# in flake.nix

# Prisma with flakes: https://github.com/prisma/prisma/issues/3026#issuecomment-927258138
{
  description = "JOSSO/IAM.tf project flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    flake-utils.url = "github:numtide/flake-utils";
    josso-pkgs.url = "github:sgonzalezoyuela/mynix-pkgs";
  };
  outputs = { self, nixpkgs, flake-utils, josso-pkgs }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let

          javaVersion = 8;
          overlays = [
            (final: prev: {
              jdk = prev."jdk${toString javaVersion}_headless";
            })
          ];

          pkgs = import nixpkgs {
            inherit overlays system;
          };
          jossoctl = josso-pkgs.packages.${system}.jossoctl;

        in
        with pkgs;
        {
          devShells.default = mkShell {
            buildInputs = [
              jdk
              terraform
              jossoctl
            ];

            shellHook = ''
              export JAVA_HOME=${jdk}

              # Server config
              export JOSSO_CLIENT_ID="idbus-f2f7244e-bbce-44ca-8b33-f5c0bde339f7"
              export JOSSO_CLIENT_SECRET="7oUHlv(HLT%vxK4L"

              # Tools config
              export JOSSO_API_CLIENT_ID="$JOSSO_CLIENT_ID"
              export JOSSO_API_SECRET="$JOSSO_CLIENT_SECRET"

              # Aliases

              # Docker
              alias drun='docker run'
              alias dstart='docker start'
              alias dexec='docker exec'
              alias dcon='docker container'
              alias dvol='docker volume'
              alias dimg='docker image'
              alias dcp='docker cp'
              alias dnet='docker network'
              alias dbld='docker build'
              alias dtag='docker tag'
              alias dsts='docker stats'
              alias dpull='docker pull'
              alias dcomp='docker-compose'
              alias dinsn="docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
              alias dlogs='docker logs -t'




            '';
          };
        }
      );
}
