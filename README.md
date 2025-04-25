# 8086-project
##Find code in master branch.
# 🏦 Bank Account Management System (x86 Assembly)

This is a fully functional Bank Account Management System written in **x86 Assembly (TASM)**. It features secure login, balance inquiry, deposit/withdrawal, and new account creation — all handled at a low level with direct memory manipulation.

---

## 🔧 Features

- 🔐 **Password Authentication**
- 🧾 **Check Account Balance**
- 💸 **Deposit Money**
- 🏧 **Withdraw Money**
- ➕ **Open New Account**

---

## 📁 How It Works

1. **Account Verification**
   - The user enters their **account number**.
   - The system matches it with stored data.

2. **Password Protection**
   - Each account has a password.
   - Masked input (with `*`) is used for password entry.

3. **Operations**
   - **Check Balance**: Displays current balance.
   - **Deposit**: Adds entered amount to balance.
   - **Withdraw**: Subtracts amount after checking balance.
   - **Open Account**: Stores new account number, password, and initial balance.

---

## 🧠 Technical Details

- Written using **TASM** (Turbo Assembler)
- Runs in **Real Mode** (DOS interrupt 21h)
- All data stored in memory (array simulation of a database)
- Uses:
  - String manipulation
  - Arithmetic operations
  - ASCII ↔ integer conversions
  - Loops, conditions, and memory indexing

---

## 🚀 How to Run

1. Install **TASM** and **Turbo Debugger** (or DOSBox with TASM setup).
2. Assemble and link the file:
   ```bash
   tasm bank system management.asm
   tlink bank system managemrnt.obj
