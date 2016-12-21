#=============================================================================#
# Libraries Setup                                                             #
#=============================================================================#
# SDL2
SDL2_DIR     := C:\DevLib\SDL2
SDL2_FLAGS   := -lSDL2main -lSDL2

# GLEW
GLFW_DIR     := C:\DevLib\GLFW
GLFW_FLAGS   := -lglfw3 -lgdi32

# Vulkan
VULKAN_DIR   := C:\DevLib\VulkanSDK\1.0.37.0
VULKAN_FLAGS := -lvulkan-1

# GLAD
GLAD_DIR     := C:\DevLib\GLAD

# GLM
GLM_DIR      := C:\DevLib\GLM

# Include paths
INC_PATHS    := -I$(SDL2_DIR)\include \
                -I$(GLFW_DIR)\include \
                -I$(GLAD_DIR)\include \
                -I$(GLM_DIR)\include \
                -I$(VULKAN_DIR)\Include

# Library paths
LIB_PATHS    := -L$(SDL2_DIR)\lib \
                -L$(GLFW_DIR)\lib-mingw \
                -L$(VULKAN_DIR)\Bin32


#=============================================================================#
# Source                                                                      #
#=============================================================================#
SRC_DIR      := source

# Files to compile as part of the project
SRC          := $(GLAD_DIR)\src\glad.c \
                $(wildcard $(SRC_DIR)/*.cpp) \
                $(wildcard $(SRC_DIR)/*/*/*.cpp) \
                $(wildcard $(SRC_DIR)/*/*/*.h)


#=============================================================================#
# Build                                                                       #
#=============================================================================#
# Build directory
BUILD_DIR    := build

# Bin directory
BIN_DIR          := $(BUILD_DIR)/bin

# Object files
OBJ          := $(patsubst $(SRC), $(BIN_DIR)/%.o, $(SRC))

# Name of executable
EXE          := primitive


#=============================================================================#
# Compiler Settings                                                           #
#=============================================================================#
# Compiler
CC           := g++

# Compiler flags
CC_FLAGS     := -w -Wl,-subsystem,windows -std=c++0x 

# Libraries to link
LD_FLAGS     := -lmingw32 $(SDL2_FLAGS) $(GLFW_FLAGS) $(VULKAN_FLAGS) -lOpengl32


all: $(SRC)
	$(CC) $(SRC) $(INC_PATHS) $(LIB_PATHS) $(CC_FLAGS) $(LD_FLAGS) -o $(BUILD_DIR)/$(EXE)

clean:
	@rm -rf $(BUILD_DIR)/*o $(BUILD_DIR)/$(EXE)

run:
	@$(BUILD_DIR)/$(EXE)