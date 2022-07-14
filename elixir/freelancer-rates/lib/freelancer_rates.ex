defmodule FreelancerRates do
  @daily_rate 8
  @monthly_billable_days 22

  def daily_rate(hourly_rate) do
    1.0 * hourly_rate * @daily_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_cost = daily_rate(hourly_rate) * @monthly_billable_days
    Float.ceil(apply_discount(monthly_cost, discount)) |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    monthly_cost_with_discount = monthly_rate(hourly_rate, discount)
    Float.floor((@monthly_billable_days * budget) / monthly_cost_with_discount, 1)
  end
end
