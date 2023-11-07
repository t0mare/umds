# Containerized UMDS

VMware UMDS (Update Manager Download Service) Running in Docker.

## UMDS

`Dockerfile`expects to find `./install/VMware-UMDS-8.0.2.00100-11979815.tar.gz`. UMDS version must match vCenter version. Installer found in vCenter installer package. UMDS expects `./data/umds/download` to be writeable as user `101`.

The UMDS service is triggered on container startup and on a given time, defaults to 01:00. Change time with `SCHEDULEDTIME` environment variable in `docker-compose.yml`

UMDS config added as example under `./data/umds/downloadConfig.xml` Set up to download VMware host updates for ESXI 8.0. Comment out the line `- ./data/umds/downloadConfig.xml:/usr/local/vmware-umds/bin/downloadConfig.xml:ro` from `docker-compose.yml` to default to all 6.7, 7.0 and 8.0 updates. or look at
[Documentation](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-lifecycle-manager/GUID-7D29B608-812B-41C4-868E-9D2006CEEBF9.html)

## Nginx

Patches made available to vCenter with Nginx. Usin default config except `autoindex on`, to allow directory listing.
