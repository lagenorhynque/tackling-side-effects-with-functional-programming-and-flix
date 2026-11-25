pub mod TacklingSideEffects.AlgebraicEffect {
    pub def example(): Unit \ IO =
        let cup = run {
            Cafe.buyCoffee(Payment.CreditCard.CreditCard("A"))
        } with Payment.runWithIO;
        println("a cup of ${cup}")
}
