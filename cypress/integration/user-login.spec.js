describe("jungle app", () => {
  beforeEach(() => {
    cy.visit('localhost:3001');
  })

  context("test that users can login successfully", () => {
    it("user can sign up and is logged into the dashboard", () => {
      cy.get('a').contains("Signup").click()
      cy.get('#user_first_name').type("Test")
      cy.get('#user_last_name').type("User")
      cy.get('#user_email').type("test@test.com")
      cy.get('#user_password').type("test1234")
      cy.get('#user_password_confirmation').type("test1234")

      cy.get('input').contains("Submit").click()

      cy.get('li').contains("Signed in as Test")

      cy.get('a').contains("Logout").click()
      cy.get('#email').type("test@test.com")
      cy.get('#password').type("test1234")
    })
    it("can login using credentials", () => {

      cy.get('a').contains("Login").click()
      cy.get('#email').type("test@test.com")
      cy.get('#password').type("test1234")
      cy.get('input').contains("Submit").click()

      cy.get('li').contains("Signed in as Test")
    })
  })
})