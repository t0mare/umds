#!/bin/bash
echo "Creating UMDS Installer answer file ..."

cat > /tmp/answer << __EOF__
/usr/local/vmware-umds
yes
no
/var/lib/vmware-umds
yes

__EOF__

echo "Install VUM UMDS ..."
cat /tmp/answer | /tmp/vmware-umds-distrib/vmware-install.pl EULA_AGREED=yes