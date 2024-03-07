FROM swift:5.10-jammy

# Install swift-format 
RUN \
  git clone https://github.com/apple/swift-format \
    -b 509.0.0 /opt/swift-format \
  && cd /opt/swift-format \
  # Compile in debug because compiling in release is very slow
  && swift build -c debug \
  && cp -f .build/debug/swift-format /usr/bin/swift-format \
  && rm -rf /opt/swift-format
  