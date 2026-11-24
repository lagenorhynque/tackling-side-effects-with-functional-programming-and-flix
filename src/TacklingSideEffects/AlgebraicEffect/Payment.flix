pub mod TacklingSideEffects.AlgebraicEffect.Payment {
    pub eff Payment {
        def charge(cc: CreditCard, amount: Float64): Unit
    }

    pub enum CreditCard(String) with Eq, ToString
}
