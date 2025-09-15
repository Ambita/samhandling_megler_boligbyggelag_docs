---
title: "API Documentation"
layout: home
---

<div class="hero-section">
  <h1>Samhandling Megler Boligbyggelag</h1>
  <p class="hero-description">API Documentation for cooperation between brokers and accountants in the Norwegian real estate market</p>
</div>

<div class="navigation-cards">
  <div class="card-section">
    <h2>Main Process Flow Messages</h2>
    <div class="card-grid">
      <div class="nav-card">
        <h3><a href="docs/boliginformasjon">Boliginformasjon</a></h3>
        <p>Property information requests</p>
      </div>
      <div class="nav-card">
        <h3><a href="docs/forhandsutlysing">Forhåndsutlysing</a></h3>
        <p>Advance clarification of preemption rights</p>
      </div>
      <div class="nav-card">
        <h3><a href="docs/salgsmelding">Salgsmelding</a></h3>
        <p>Sales notifications and ownership transfers</p>
      </div>
      <div class="nav-card">
        <h3><a href="docs/endring-overdragelsesdato">Endring overdragelsesdato</a></h3>
        <p>Transfer date changes</p>
      </div>
      <div class="nav-card">
        <h3><a href="docs/endring-kjopere">Endring kjøpere</a></h3>
        <p>Buyer changes</p>
      </div>
      <div class="nav-card">
        <h3><a href="docs/sluttbrev">Sluttbrev</a></h3>
        <p>Final completion letters</p>
      </div>
      <div class="nav-card">
        <h3><a href="docs/restanse">Restanse</a></h3>
        <p>Arrears handling</p>
      </div>
    </div>
  </div>

  <div class="card-section">
    <h2>Standalone Information Messages</h2>
    <div class="card-grid">
      <div class="nav-card">
        <h3><a href="docs/sumgjeld">SumGjeld</a></h3>
        <p>Total debt requests</p>
      </div>
      <div class="nav-card">
        <h3><a href="docs/sumfelleskostnader">SumFelleskostnader</a></h3>
        <p>Total common costs requests</p>
      </div>
    </div>
  </div>

  <div class="card-section">
    <h2>System Messages</h2>
    <div class="card-grid">
      <div class="nav-card">
        <h3><a href="docs/feilmeldinger">Feilmeldinger</a></h3>
        <p>Error messages</p>
      </div>
    </div>
  </div>
</div>

<div class="getting-started">
  <h2>Getting Started</h2>
  <p>Ambita has designed a set of API messages to capture the flow between a broker and an accountant. These messages enable digital cooperation for property sales, ownership transfers, and financial information requests.</p>
  <p><a href="README" class="btn btn-primary">Read the full documentation →</a></p>
</div>

<style>
/* Homepage styling with Ambita Design Tokens */
.hero-section {
  text-align: center;
  padding: 3rem 2rem;
  background: linear-gradient(135deg, var(--ambita-purple-600) 0%, var(--ambita-purple-400) 100%);
  color: var(--ambita-white);
  margin: -2rem -2rem 2rem -2rem;
  border-radius: var(--border-radius-m);
  font-family: var(--font-family-display);
}

.hero-section h1 {
  color: var(--ambita-white);
  font-family: var(--font-family-display);
  font-weight: 700;
  margin-bottom: 1rem;
}

.hero-description {
  font-size: 1.2rem;
  margin-top: 1rem;
  opacity: 0.95;
  font-family: var(--font-family-body);
}

.navigation-cards {
  margin: 2rem 0;
}

.card-section {
  margin-bottom: 3rem;
}

.card-section h2 {
  border-bottom: 3px solid var(--ambita-purple-400);
  padding-bottom: 0.5rem;
  margin-bottom: 1.5rem;
  color: var(--ambita-purple-600);
  font-family: var(--font-family-display);
  font-weight: 600;
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
  margin-top: 1rem;
}

.nav-card {
  background: var(--ambita-white);
  border: 1px solid var(--ambita-purple-200);
  border-radius: var(--border-radius-m);
  padding: 1.5rem;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(13, 10, 39, 0.1);
}

.nav-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 24px rgba(13, 10, 39, 0.15);
  border-color: var(--ambita-purple-400);
  background: var(--ambita-purple-100);
}

.nav-card h3 {
  margin: 0 0 0.5rem 0;
  font-size: 1.1rem;
  font-family: var(--font-family-title);
  font-weight: 600;
}

.nav-card h3 a {
  text-decoration: none;
  color: var(--ambita-purple-600);
  transition: color 0.2s ease;
}

.nav-card h3 a:hover {
  color: var(--ambita-purple-500);
  text-decoration: none;
}

.nav-card p {
  margin: 0;
  color: var(--ambita-grey-400);
  font-size: 0.9rem;
  font-family: var(--font-family-body);
  line-height: 1.4;
}

.getting-started {
  background: var(--ambita-peach-100);
  border: 1px solid var(--ambita-peach-200);
  padding: 2rem;
  border-radius: var(--border-radius-m);
  text-align: center;
  margin-top: 3rem;
}

.getting-started h2 {
  color: var(--ambita-purple-600);
  font-family: var(--font-family-display);
  margin-bottom: 1rem;
  border: none;
  padding: 0;
}

.getting-started p {
  color: var(--ambita-purple-600);
  font-family: var(--font-family-body);
  line-height: 1.6;
}

.btn {
  display: inline-block;
  padding: 0.75rem 1.5rem;
  background: var(--ambita-purple-500);
  color: var(--ambita-white);
  text-decoration: none;
  border-radius: var(--border-radius-s);
  font-family: var(--font-family-title);
  font-weight: 500;
  transition: all 0.2s ease;
  border: 1px solid var(--ambita-purple-500);
}

.btn:hover {
  background: var(--ambita-purple-400);
  border-color: var(--ambita-purple-400);
  color: var(--ambita-white);
  text-decoration: none;
  transform: translateY(-1px);
}

@media (max-width: 768px) {
  .card-grid {
    grid-template-columns: 1fr;
  }
  
  .hero-section {
    padding: 2rem 1rem;
  }
  
  .hero-section h1 {
    font-size: 2rem;
  }
}
</style>
