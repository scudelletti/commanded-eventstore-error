defmodule BankAccount do
  defstruct [:account_number, :balance]

  # Public command API
  def execute(%BankAccount{account_number: nil}, %OpenBankAccount{
        account_number: account_number,
        initial_balance: initial_balance
      })
      when initial_balance > 0 do
    %BankAccountOpened{account_number: account_number, initial_balance: initial_balance}
  end

  # Ensure initial balance is never zero or negative
  def execute(%BankAccount{}, %OpenBankAccount{initial_balance: initial_balance})
      when initial_balance <= 0 do
    {:error, :initial_balance_must_be_above_zero}
  end

  # Ensure account has not already been opened
  def execute(%BankAccount{}, %OpenBankAccount{}) do
    {:error, :account_already_opened}
  end

  def execute(%BankAccount{account_number: account_number}, %Deposit{
        value: value
      }) do
    %Deposited{account_number: account_number, value: value}
  end

  # State mutators
  def apply(%BankAccount{} = account, %BankAccountOpened{} = event) do
    %BankAccountOpened{account_number: account_number, initial_balance: initial_balance} = event
    %BankAccount{account | account_number: account_number, balance: initial_balance}
  end

  def apply(%BankAccount{balance: balance} = account, %Deposited{value: value}) do
    %BankAccount{account | balance: balance + value}
  end
end
