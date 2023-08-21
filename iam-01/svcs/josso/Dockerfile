FROM  atricore/josso-ee:2.6.1-6

# Some config
USER atricore

COPY ./etc/org.ops4j.pax.logging.cfg /opt/atricore/josso-ee/server/etc/org.ops4j.pax.logging.cfg
COPY ./etc/host.key /opt/atricore/josso-ee/server/etc/host.key
COPY ./etc/org.atricore.idbus.kernel.main.cfg /opt/atricore/josso-ee/server/etc/org.atricore.idbus.kernel.main.cfg
COPY ./etc/atricore.lic /opt/atricore/josso-ee/server/etc/atricore.lic