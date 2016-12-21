#include "window.h"

void windowResize(GLFWwindow *window, int width, int height);


Window::Window(const char *title, int width, int height) {
	mTitle = title;
	mWidth = width;
	mHeight = height;

	if(!init()) {
		glfwTerminate();
	}
}

Window::~Window() {
	glfwTerminate();
}

bool Window::init() {
	if(!glfwInit()) {
		// log
		return false;
	}

	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 5);

	mWindow = glfwCreateWindow(mWidth, mHeight, mTitle, NULL, NULL);

	if(!mWindow) {
		// log
		return false;
	}

	glfwMakeContextCurrent(mWindow);
    //gladLoadGLLoader((GLADloadproc) glfwGetProcAddress);
    //glfwSwapInterval(1);
	glfwSetWindowSizeCallback(mWindow, windowResize);

	// log
    return true;
}

void Window::clear() const {
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}

void Window::update() const {
	glfwSwapBuffers(mWindow);
	//glfwGetFrameBufferSize(mWindow, &mWidth, &mHeight);
	glfwPollEvents();
}

bool Window::closed() const {
	return glfwWindowShouldClose(mWindow) == 1;
}


void windowResize(GLFWwindow *window, int width, int height) {
	glViewport(0, 0, width, height);
}