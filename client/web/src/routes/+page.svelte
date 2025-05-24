<script>
  // Sample data for demonstration purposes
  const topPlayers = [
    { rank: 1, name: 'Player1', avatar: '/images/avatar1.png', kd: 2.45, winRate: 68.2, headshot: 62.5 },
    { rank: 2, name: 'Player2', avatar: '/images/avatar2.png', kd: 2.31, winRate: 65.7, headshot: 58.9 },
    { rank: 3, name: 'Player3', avatar: '/images/avatar3.png', kd: 2.28, winRate: 64.3, headshot: 61.2 },
    { rank: 4, name: 'Player4', avatar: '/images/avatar4.png', kd: 2.15, winRate: 62.8, headshot: 57.4 },
    { rank: 5, name: 'Player5', avatar: '/images/avatar5.png', kd: 2.09, winRate: 61.5, headshot: 59.8 }
  ];
  
  const popularMaps = [
    { name: 'Dust II', image: '/images/dust2.jpg', playRate: 28.5 },
    { name: 'Mirage', image: '/images/mirage.jpg', playRate: 22.7 },
    { name: 'Inferno', image: '/images/inferno.jpg', playRate: 18.3 },
    { name: 'Nuke', image: '/images/nuke.jpg', playRate: 12.6 }
  ];
  
  const weaponStats = [
    { name: 'AK-47', image: '/images/ak47.png', pickRate: 26.8, killsPerMatch: 5.2 },
    { name: 'M4A4', image: '/images/m4a4.png', pickRate: 18.5, killsPerMatch: 4.7 },
    { name: 'AWP', image: '/images/awp.png', pickRate: 15.3, killsPerMatch: 3.8 },
    { name: 'Desert Eagle', image: '/images/deagle.png', pickRate: 12.1, killsPerMatch: 2.5 }
  ];
</script>

<svelte:head>
  <title>FairPlay CS2</title>
  <meta name="description" content="Track your CS2 stats, view leaderboards, and compare with friends" />
</svelte:head>

<section class="hero">
  <div class="container">
    <div class="hero-content">
      <h1 class="hero-title">Expose Cheaters. Play Fair.</h1>
      <p class="hero-subtitle">Stay ahead with the most accurate CS2 cheater database.
      Track suspicious players, report offenders, and compete with confidence.
      Plus, monitor your own stats, compare with friends, and rise through the ranks—cheat-free.</p>
      <div class="hero-buttons">
        <a href="/search" class="btn btn-primary">Find Player</a>
        <a href="/leaderboards" class="btn btn-secondary">View Leaderboards</a>
      </div>
    </div>
  </div>
</section>

<div class="container">
  <!-- Overview Stats Section -->
  <section class="section">
    <h2 class="section-title">Global Stats Overview</h2>
    <div class="grid grid-4">
      <div class="card stat-card">
        <span class="stat-value">2.1M+</span>
        <span class="stat-label">Players Tracked</span>
      </div>
      <div class="card stat-card">
        <span class="stat-value">48.2%</span>
        <span class="stat-label">Average Win Rate</span>
      </div>
      <div class="card stat-card">
        <span class="stat-value">0.98</span>
        <span class="stat-label">Average K/D Ratio</span>
      </div>
      <div class="card stat-card">
        <span class="stat-value">47.3%</span>
        <span class="stat-label">Average Headshot %</span>
      </div>
    </div>
  </section>
  
  <!-- Top Players Section -->
  <section class="section">
    <div class="section-header">
      <h2 class="section-title">Top Players</h2>
      <a href="/leaderboards" class="section-link">View All</a>
    </div>
    <div class="card">
      <table class="leaderboard-table">
        <thead>
          <tr>
            <th>Rank</th>
            <th>Player</th>
            <th>K/D</th>
            <th>Win %</th>
            <th>HS %</th>
          </tr>
        </thead>
        <tbody>
          {#each topPlayers as player}
            <tr>
              <td class="rank">#{player.rank}</td>
              <td class="player">
                <div class="player-info">
                  <div class="avatar-placeholder"></div>
                  <span>{player.name}</span>
                </div>
              </td>
              <td>{player.kd.toFixed(2)}</td>
              <td>{player.winRate.toFixed(1)}%</td>
              <td>{player.headshot.toFixed(1)}%</td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </section>
  
  <!-- Maps & Weapons Section -->
  <div class="two-column-section">
    <!-- Popular Maps -->
    <section class="section">
      <div class="section-header">
        <h2 class="section-title">Popular Maps</h2>
        <a href="/maps" class="section-link">View All</a>
      </div>
      <div class="grid grid-2">
        {#each popularMaps as map}
          <div class="card map-card">
            <div class="map-placeholder"></div>
            <div class="map-info">
              <h3>{map.name}</h3>
              <p>{map.playRate}% Play Rate</p>
            </div>
          </div>
        {/each}
      </div>
    </section>
    
    <!-- Weapon Stats -->
    <section class="section">
      <div class="section-header">
        <h2 class="section-title">Weapon Stats</h2>
        <a href="/weapons" class="section-link">View All</a>
      </div>
      <div class="grid grid-2">
        {#each weaponStats as weapon}
          <div class="card weapon-card">
            <div class="weapon-placeholder"></div>
            <div class="weapon-info">
              <h3>{weapon.name}</h3>
              <p>{weapon.pickRate}% Pick Rate</p>
              <p>{weapon.killsPerMatch} Kills/Match</p>
            </div>
          </div>
        {/each}
      </div>
    </section>
  </div>
  
  <!-- Call to Action -->
  <section class="cta-section">
    <div class="card cta-card">
      <h2>Ready to track your progress?</h2>
      <p>Enter your Steam ID or username to get started</p>
      <div class="cta-search">
        <input type="text" placeholder="Steam ID or Username" />
        <button class="btn btn-primary">Track Now</button>
      </div>
    </div>
  </section>
</div>

<style>
  /* Hero section specific styles */
  .hero {
    background: linear-gradient(to right, rgba(10, 30, 44, 0.9), rgba(10, 30, 44, 0.7)), url('/images/cs2-hero.jpg');
    background-color: var(--secondary-color); /* Fallback */
    padding: 4rem 0;
    margin-bottom: 2rem;
  }
  
  .hero-buttons {
    display: flex;
    gap: 1rem;
    margin-top: 1.5rem;
  }
  
  /* Section styles */
  .section {
    margin-bottom: 3rem;
  }
  
  .section-title {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    color: var(--text-color);
  }
  
  .section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
  }
  
  .section-link {
    color: var(--primary-color);
    font-weight: 500;
  }
  
  /* Leaderboard table styles */
  .leaderboard-table {
    width: 100%;
    border-collapse: collapse;
  }
  
  .leaderboard-table th {
    text-align: left;
    padding: 1rem;
    border-bottom: 1px solid var(--border-color);
    color: var(--text-secondary);
    font-weight: 500;
  }
  
  .leaderboard-table td {
    padding: 1rem;
    border-bottom: 1px solid var(--border-color);
  }
  
  .leaderboard-table tr:last-child td {
    border-bottom: none;
  }
  
  .rank {
    font-weight: 700;
    color: var(--primary-color);
  }
  
  .player-info {
    display: flex;
    align-items: center;
    gap: 0.75rem;
  }
  
  .avatar-placeholder {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background-color: var(--border-color);
  }
  
  /* Map and weapon cards */
  .two-column-section {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 2rem;
    margin-bottom: 3rem;
  }
  
  .map-card, .weapon-card {
    display: flex;
    align-items: center;
    padding: 1rem;
    gap: 1rem;
  }
  
  .map-placeholder, .weapon-placeholder {
    width: 80px;
    height: 60px;
    background-color: var(--border-color);
    border-radius: 4px;
  }
  
  .map-info h3, .weapon-info h3 {
    margin-bottom: 0.25rem;
    font-size: 1rem;
  }
  
  .map-info p, .weapon-info p {
    color: var(--text-secondary);
    font-size: 0.875rem;
  }
  
  /* CTA section */
  .cta-section {
    margin-bottom: 3rem;
  }
  
  .cta-card {
    padding: 2rem;
    text-align: center;
    background: linear-gradient(to right, var(--secondary-color), #1a3a4a);
  }
  
  .cta-card h2 {
    margin-bottom: 0.5rem;
    font-size: 1.75rem;
  }
  
  .cta-card p {
    margin-bottom: 1.5rem;
    color: var(--text-secondary);
  }
  
  .cta-search {
    display: flex;
    max-width: 500px;
    margin: 0 auto;
  }
  
  .cta-search input {
    flex: 1;
    padding: 0.75rem 1rem;
    border: none;
    border-radius: 4px 0 0 4px;
    background-color: rgba(255, 255, 255, 0.1);
    color: var(--text-color);
  }
  
  .cta-search input:focus {
    outline: none;
    background-color: rgba(255, 255, 255, 0.15);
  }
  
  .cta-search button {
    border-radius: 0 4px 4px 0;
  }
  
  /* Responsive styles */
  @media (max-width: 768px) {
    .two-column-section {
      grid-template-columns: 1fr;
      gap: 3rem;
    }
    
    .hero-title {
      font-size: 2rem;
    }
    
    .hero-buttons {
      flex-direction: column;
      gap: 0.75rem;
    }
    
    .btn {
      width: 100%;
    }
    
    .cta-search {
      flex-direction: column;
      gap: 0.75rem;
    }
    
    .cta-search input,
    .cta-search button {
      width: 100%;
      border-radius: 4px;
    }
  }
  
  @media (max-width: 640px) {
    .leaderboard-table th:nth-child(4),
    .leaderboard-table td:nth-child(4) {
      display: none;
    }
  }
</style>
