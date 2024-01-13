{ config, lib, pkgs, ... }:
{
	virtualisation.oci-containers.containers.syncthing = {
		autoStart = true;
		image = "lscr.io/linuxserver/syncthing:latest";
		environment = {
			PUID = "1000"; 
			PGID = "1000";
		};
		ports = [
			"22000:22000/tcp"
			"22000:22000/udp"
			"21027:21027/udp"
		];
		volumes = [
			"/media/Archives/sawczukserver/selfhosted/syncthing:/config"
			"/home/pedrojosawczuk/backups:/data/backups"
			"/home/pedrojosawczuk/.oculta:/data/.oculta"
			"/home/pedrojosawczuk/Music:/data/Music"
			"/home/pedrojosawczuk/Videos:/data/Videos"
			"/home/pedrojosawczuk/Downloads:/data/Downloads"
			"/home/pedrojosawczuk/Documents:/data/Documents"
			"/home/pedrojosawczuk/Pictures:/data/Pictures"
			"/home/pedrojosawczuk/Pictures/Camera:/data/Camera"
		];
		dependsOn = [ "traefik" ];
		extraOptions = [
			"--network=containers-network"
			"-l" "traefik.enable=true"
			"-l" "traefik.http.routers.syncthing.entrypoints=http"
			"-l" "traefik.http.routers.syncthing.rule=Host(`syncthing.docker.localhost`)"
			"-l" "traefik.http.middlewares.syncthing-https-redirect.redirectscheme.scheme=https"
			"-l" "traefik.http.routers.syncthing.middlewares=syncthing-https-redirect"
			"-l" "traefik.http.routers.syncthing-secure.entrypoints=https"
			"-l" "traefik.http.routers.syncthing-secure.rule=Host(`syncthing.docker.localhost`)"
			"-l" "traefik.http.routers.syncthing-secure.tls=true"
			"-l" "traefik.http.routers.syncthing-secure.service=syncthing"
			"-l" "traefik.http.services.vsyncthingloadbalancer.server.port=8384"
			"-l" "traefik.docker.network=containers-network"
		];
	};
}