FROM swift:5.10-jammy

ENV SWIFT_FORMAT_VERSION=510.0.0

# Install swift-format 
RUN \
  git clone https://github.com/apple/swift-format \
    -b $SWIFT_FORMAT_VERSION /opt/swift-format \
  && cd /opt/swift-format \
  && sed -i'' \
    "s/print(\".*\")/print(\"$SWIFT_FORMAT_VERSION\")/" \
    Sources/swift-format/VersionOptions.swift \
  # Compile in debug because compiling in release is very slow
  && swift build -c debug \
  && cp -f .build/debug/swift-format /usr/bin/swift-format \
  && rm -rf /opt/swift-format
  