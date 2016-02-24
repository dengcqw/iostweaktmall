THEOS_DEVICE_IP = 10.59.92.214
ARCHS = arm64 armv7
TARGET = iphone:latest:8.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iOSTweakTmall
iOSTweakTmall_FILES = Tweak.xm

iOSREProject_FRAMEWORKS = UIKit NSFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Tmall4iPhone"
