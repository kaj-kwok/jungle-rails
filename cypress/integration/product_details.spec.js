describe("jungle app", () => {
  beforeEach(() => {
    cy.visit('localhost:3001');
  });

  context("clicking on product article", () => {
    it("click on product article should show product page", () => {
      cy.get(".products article").first()
        .click();

      cy.get('.product-detail')
        .should('be.visible');
    });
  });
  context("clicking on product image", () => {
    it("clicking on product image should show product page", () => {
      cy.get('.products > article').first()
        .find('img').click();
      cy.get('.product-detail')
        .should('be.visible');

    });
  });
});