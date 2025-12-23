#!/bin/bash
# 🔍 Check filesystem speed (optional but spicy)

# Tests write speed by writing a 100MB file using dd
TEST_FILE="/tmp/speedtest_$$"
TEST_SIZE="100M"

echo "Testing write speed..."
WRITE_SPEED=$(dd if=/dev/zero of="$TEST_FILE" bs=1M count=100 oflag=direct 2>&1 | grep -o '[0-9.]* MB/s' | tail -1)
echo "Write speed: $WRITE_SPEED"

# Tests read speed by reading that file back
echo ""
echo "Testing read speed..."
# Clear filesystem cache before the read test (for more accurate results)
sync
echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null 2>&1 || true

READ_SPEED=$(dd if="$TEST_FILE" of=/dev/null bs=1M iflag=direct 2>&1 | grep -o '[0-9.]* MB/s' | tail -1)
echo "Read speed: $READ_SPEED"

# Clean up the test file
rm -f "$TEST_FILE"

# echo ""
# echo "Filesystem information:"
# df -hT
