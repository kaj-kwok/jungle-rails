describe("jungle app", () => {
  beforeEach(() => {
    cy.visit('localhost:3001');
  })
  context("add to card", () => {
    it("There is products on the page", () => {
      cy.get(".products article").should("be.visible")
    })
    it("There is 2 products on the page", () => {
      cy.get(".products article").should("have.length", 2)
    })
    it("should be able to click on add button on homepage and cart increase by 1", () => {
      cy.get('.products-index')
        .find('article').not(':contains("Sold Out")').get('form').contains("Add").click({ force: true })
      //test to see if cart on nav updates
      cy.get('.nav-item.end-0 > a').contains(1)
    })
    it("should be able to click on add button twice on homepage and cart increase by 2", () => {
      for (let n = 0; n < 2; n++) {
        cy.get('.products-index')
          .find('article').not(':contains("Sold Out")').get('form').contains("Add").click({ force: true })
        cy.wait(2000)
      }
      cy.get('.nav-item.end-0 > a').click()
      cy.get('tbody').contains(2)
    })
    it("should not add to cart if product is out of stock", () => {
      cy.get('.products-index')
        .find('article').filter(':contains("Sold Out")').get('button').should('be.disabled')
    })
  });
}); 