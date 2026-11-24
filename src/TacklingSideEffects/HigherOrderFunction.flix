pub mod TacklingSideEffects.HigherOrderFunction {
    pub def example(): Unit \ IO =
        let cup = Cafe.buyCoffee(CreditCard.charge);
        println("a cup of ${cup}")
}
