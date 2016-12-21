#include "core/components/window.h"

int main(int argc, char *argv[]) {
	Window mWindow("Primitive", 960, 800);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

	while(!mWindow.closed()) {
		mWindow.clear();
		mWindow.update();
	}
}