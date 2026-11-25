pub mod TacklingSideEffects.AlgebraicEffect.Payment {
    pub eff Payment {
        def charge(cc: CreditCard, amount: Float64): Unit
    }

    pub enum CreditCard(String) with Eq, ToString

    pub def runWithIO(f: Unit -> a \ ef): a \ (ef - Payment) + IO =
        run {
            f()
        } with handler Payment {
            def charge(cc, amount, resume) = {
                println("charging ${amount} to ${cc}");
                resume()
            }
        }
}
