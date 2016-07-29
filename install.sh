apt-get update && apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential
rosdep init && rosdep fix-permissions && rosdep update
mkdir ~/ros_catkin_ws && cd ~/ros_catkin_ws/
apt-get install -y python-nose cmake python-dev libboost-all-dev python-empy python-empy libtinyxml-dev libgtest-dev python-numpy sbcl python-imaging libbz2-dev pkg-config libaprutil1-dev python-coverage liblog4cxx10-dev python-matplotlib python-matplotlib python-wxgtk3.0 tango-icon-theme libeigen3-dev libcollada-dom2.4-dp-dev python-sip-dev shiboken libpyside-dev liburdfdom-dev python-qt4-dev unzip python-qt4-gl python-psutil libpoco-dev libyaml-cpp-dev python-pygraphviz libqhull-dev liblz4-dev python-pydot python-opencv hddtemp python-pyside libogre-1.9-dev libogre-1.9-dev python-opengl libassimp-dev libshiboken-dev libcurl4-openssl-dev python-netifaces libopencv-dev libcppunit-dev python-paramiko python-qwt5-qt4 libpcl1.7 libpcl-dev libsdl-image1.2-dev libvtk-java python-vtk6 libproj-dev libproj9 libproj-java
rosinstall_generator desktop --rosdistro indigo --deps --wet-only --tar > indigo-desktop-wet.rosinstall
curl https://raw.githubusercontent.com/I0x0I/humanoid_navigation/rosinstall/indigo-humanoid-extra.rosinstall >> indigo-desktop-wet.rosinstall
wstool init -j8 src indigo-desktop-wet.rosinstall
mkdir src/sbpl/build && cd src/sbpl/build
cmake .. && make && make install
cd ../../../
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release
