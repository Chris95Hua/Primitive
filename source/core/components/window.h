#pragma once

#include <GLFW/glfw3.h>

class Window {
	private:
		const char *mTitle;
		unsigned int mWidth, mHeight;
		GLFWwindow* mWindow;
		bool mClosed;
	public:
		Window(const char *title, int width, int height);
		~Window();
		void clear() const;
		void update() const;
		bool closed() const;

		inline int getWidth() const { return mWidth; }
		inline int getHeight() const { return mHeight; }
	private:
		bool init();
};