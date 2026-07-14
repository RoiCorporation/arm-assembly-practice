# syntax=docker/dockerfile:1
FROM ubuntu:latest

# Install all necessary dependencies
RUN apt-get update
RUN apt-get install -y curl gpg
RUN curl "https://developer.arm.com/packages/arm-toolchains:ubuntu-24/noble/Release.key" | gpg --dearmor -o /usr/share/keyrings/obs-oss-arm-com.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/obs-oss-arm-com.gpg] https://developer.arm.com/packages/arm-toolchains:ubuntu-24/noble/ ./" | tee /etc/apt/sources.list.d/obs-oss-arm-com.list
RUN apt update
RUN apt install -y arm-toolchains-transition
RUN apt update
RUN apt install -y arm-toolchain-for-linux environment-modules

# Set up environmental modules to make toolchain commands available from the
# command line
SHELL ["/bin/bash", "-c"]
CMD ["bash", "-lc", "source /etc/profile.d/modules.sh && module use /opt/arm/modulefiles && module load atfl && exec bash"]

# Move to the appropriate working directory
WORKDIR /practice_exercises
