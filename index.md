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
.hero-section {
  text-align: center;
  padding: 3rem 0;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  margin: -2rem -2rem 2rem -2rem;
  border-radius: 8px;
}

.hero-description {
  font-size: 1.2rem;
  margin-top: 1rem;
  opacity: 0.9;
}

.navigation-cards {
  margin: 2rem 0;
}

.card-section {
  margin-bottom: 3rem;
}

.card-section h2 {
  border-bottom: 2px solid #2a7ae4;
  padding-bottom: 0.5rem;
  margin-bottom: 1.5rem;
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
  margin-top: 1rem;
}

.nav-card {
  background: white;
  border: 1px solid #e8e8e8;
  border-radius: 8px;
  padding: 1.5rem;
  transition: all 0.3s ease;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.nav-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  border-color: #2a7ae4;
}

.nav-card h3 {
  margin: 0 0 0.5rem 0;
  font-size: 1.1rem;
}

.nav-card h3 a {
  text-decoration: none;
  color: #2a7ae4;
}

.nav-card h3 a:hover {
  text-decoration: underline;
}

.nav-card p {
  margin: 0;
  color: #666;
  font-size: 0.9rem;
}

.getting-started {
  background: #f8f9fa;
  padding: 2rem;
  border-radius: 8px;
  text-align: center;
  margin-top: 3rem;
}

.btn {
  display: inline-block;
  padding: 0.75rem 1.5rem;
  background: #2a7ae4;
  color: white;
  text-decoration: none;
  border-radius: 4px;
  font-weight: 500;
  transition: background-color 0.2s ease;
}

.btn:hover {
  background: #1e5bb8;
  text-decoration: none;
}

@media (max-width: 768px) {
  .card-grid {
    grid-template-columns: 1fr;
  }
  
  .hero-section {
    padding: 2rem 1rem;
  }
}
</style>
