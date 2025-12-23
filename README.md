# System Checks

Quick diagnostics for your machine's GPU, CUDA, PyTorch, CPU, and disk performance.

## Usage

```sh
cd src
./run_system_checks.sh
```

This will run through all the checks and give you a comprehensive overview of your system capabilities.

---

Yes, they are completely different:

`disk_speed.sh`:

- Uses fio (Flexible I/O Tester) - a sophisticated benchmarking tool
- Tests read speed only
- 1GB test file, runs for 30 seconds
- Requires installing fio (`sudo dnf install -y fio`)
- Includes a reference table comparing HDD, SATA SSD, and NVMe speeds

`filesystem_speed.sh`:

- Uses dd command - basic Unix utility
- Tests both write and read speed
- 100MB test file, quick test
- Clears filesystem cache between tests for accuracy
- No additional tools needed (dd is built-in)
- Cleans up the test file when done

**The main differences:**

1. Different tools (`fio` vs `dd`)
2. Different scope (read-only vs read+write)
3. Different test sizes (1GB vs 100MB)
4. `fio` is more advanced/accurate but requires installation; `dd` is simpler and always available

<br>
