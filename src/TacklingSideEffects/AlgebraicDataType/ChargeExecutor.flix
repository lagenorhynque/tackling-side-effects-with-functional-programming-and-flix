pub mod TacklingSideEffects.AlgebraicDataType.ChargeExecutor {
    use TacklingSideEffects.AlgebraicDataType.Charge

    pub def execute(charge: Charge.Charge): Unit \ IO =
        let Charge.Charge({creditCard, amount}) = charge;
        println("charging ${amount} to ${creditCard}")
}
