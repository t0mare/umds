# Containerized UMDS
VMware UMDS (Update Manager Download Service) Running in Docker.

## UMDS
`Dockerfile`expects to find `./install/VMware-UMDS-7.0.3.00300-9499375.tar.gz`. UMDS version must match vCenter version. Installer found in vCenter installer package.
UMDS service triggered on container startup and on a given time, defaults to 01:00. Change time with `SCHEDULEDTIME` environment variable.
UMDS expects `./data/umds/download` to be writeable as user `101`.
Config added as example under `./data/umds/downloadConfig.xml` Set up to download VMware and HPE host updates for ESXI 6.7. Comment out from `docker-compose.yml` to default to all 6.5, 6.7 and 7.0 updates. or look at
[Documentation](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere-lifecycle-manager.doc/GUID-7D29B608-812B-41C4-868E-9D2006CEEBF9.html)

## Nginx
Patches made avilable to vCenter with Nginx. Usin default config except `autoindex on`, to allow directory listing.