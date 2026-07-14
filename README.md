# ARM assembly practice repository
Practice exercises to learn ARM assembly code.



## 🐳 Build the image and run the Docker container
1. Build the image defined in the [Dockerfile](./Dockerfile).
```
docker build --platform linux/arm64 -t arm-image .
```

2. Create and start a container with that image and give it access to the current
folder at the ```practice_exercises``` directory.
```
docker run -it --name arm-container -v ./practice_exercises:/practice_exercises arm-image
```

3. Inside the container, move to the folder of the particular exercise you want
to test, compile and link the .c and .s files using the ARM [**ARM Toolchain for Linux**](https://developer.arm.com/documentation/110477/221/Welcome-to-the-Arm-Toolchain-for-Linux).
Here's an example of this workflow for the example strcopy exercise.
```
armclang strcopy.s test.c -o strcopy
./strcopy
```
