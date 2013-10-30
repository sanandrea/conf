OPENVSWITCH=/home/openflow/OF/openvswitch
NOX=/home/openflow/OF/nox

configure-datapath:
	-mkdir $(OPENVSWITCH)/build
	cd $(OPENVSWITCH);./configure --prefix=$(OPENVSWITCH)/build --with-linux=/opt/netkit/kernel/build/linux-2.6.26.5 KARCH=um

compile-datapath:
	make -C $(OPENVSWITCH) ARCH=um
	
install-datapath:
	make -C $(OPENVSWITCH) ARCH=um install

clean-datapath:
	make -C $(OPENVSWITCH) ARCH=um clean	


configure-controller:
	cd $(NOX); ./boot.sh; mkdir -p build; cd build; ../configure	 

compile-controller:
	make -C $(NOX)/build

clean-controller:
	make -C $(NOX)/build clean



