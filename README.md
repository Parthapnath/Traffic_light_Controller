# 🚦 Traffic Light Controller (Verilog HDL)

This is my first digital design project in **Verilog HDL**: a **Traffic Light Controller** implemented and simulated using a testbench in ModelSim.

It simulates a simple traffic light system that controls the green, yellow, and red lights for three roads: **G-light**, **R-light**, and **Y-light**. 

---

## 🧠 Project Description

The **Traffic Light Controller** cycles through three traffic light phases:
- **Green Light (glight)**: Vehicle passage allowed
- **Yellow Light (ylight)**: Transition phase
- **Red Light (rlight)**: Vehicle stop

Each phase is controlled using a finite state machine (FSM). A reset signal is used to restart the traffic light cycle.

---

## 📁 Files Included

| File | Description |
|------|-------------|
| `Traffic_light_Controller.v` | Main Verilog HDL module |
| `Traffic_light_Controller.v.bak` | Backup copy |
| `README.md` | Project documentation |
| `*.png` | Simulation waveform screenshots |

---

## 🧪 Simulation Screenshots

### ✅ Normal Operation
Displays state transitions from Green → Yellow → Red.
![Simulation 1](./Screenshot%202025-07-27%20002803.png)

### 🔁 After Reset
FSM restarts after reset signal.
![Simulation 2](./Screenshot%202025-07-27%20002829.png)

### ⏱ Clock and Light Timing
Shows exact timing of transitions.
![Simulation 3](./Screenshot%202025-07-27%20002909.png)

---

## 🔧 Tools Used

- **Language**: Verilog HDL
- **Simulation**: ModelSim by Mentor Graphics
- **Editor**: Vivado / VS Code / Pycharm (as preferred)

---

## 🧰 How It Works

```verilog
always @(posedge clk or posedge rst) begin
    if (rst) 
        state <= RESET_STATE;
    else 
        state <= next_state;
end
