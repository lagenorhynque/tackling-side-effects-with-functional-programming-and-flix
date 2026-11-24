pub mod TacklingSideEffects.AlgebraicEffect {
    pub def example(): Unit \ IO =
        let cup = run {
            Cafe.buyCoffee(Payment.CreditCard.CreditCard("A"))
        } with handler Payment {
            def charge(cc, amount, resume) = {
                println("charging ${amount} to ${cc}");
                resume()
            }
        };
        println("a cup of ${cup}")
}
