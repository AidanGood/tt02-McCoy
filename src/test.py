import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


@cocotb.test()
async def test_my_design(dut):
    dut._log.info("start")
<<<<<<< HEAD
=======
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    dut._log.info("reset")
    dut.rst.value = 1
    await ClockCycles(dut.clk, 10)
    dut.rst.value = 0

    dut._log.info("check all segments")
    for i in range(10):
        dut._log.info("check segment {}".format(i))
        await ClockCycles(dut.clk, 100)
        assert int(dut.segments.value) == segments[i]
>>>>>>> 1a47827c09cea8a50bbd36e7353190ed11c3d62d
