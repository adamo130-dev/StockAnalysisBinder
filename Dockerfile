# Use the base Python image
FROM python:3.10

# Install .NET SDK 6.0
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --channel 6.0 \
    && ln -s ~/.dotnet/dotnet /usr/local/bin/dotnet

# Install necessary Python packages
RUN pip install yfinance pandas_ta stock-indicators jupyter

# Set the default command to launch Jupyter
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]