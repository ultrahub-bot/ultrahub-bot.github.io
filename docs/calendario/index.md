---
#title:
#icon:
description: Veja quando acontecerá os próximos boosts de gold, exp, rep, no Adventure Quest Worlds.
authors:
  - pen
date: 2025-04-08
keywords:
    - aqw calendario de eventos
    - aqw quando tem boost de rep
    - aqw quando tem boost de exp
    - aqw quando tem boost de gold
    - aqw quando tem boost de class point (cp)
tags:
social_share: true
hide:
 - toc
 - navigation
---
# Calendário
---

!!! tip "Dica"
    Veja os links à esquerda da página ou clique em :fontawesome-solid-bars: (canto superior esquerdo).
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<div id="calendar">
  <div class="md-calendar-error" hidden></div>
</div>

<style>
  /* Adicione estas regras para o tooltip */
.event-tooltip {
  position: absolute;
  background: var(--md-default-bg-color);
  color: var(--md-default-fg-color);
  border: 1px solid var(--md-default-fg-color--lightest);
  border-radius: 4px;
  padding: 1rem;
  z-index: 1000;
  box-shadow: var(--md-shadow-z2);
  max-width: 300px;
  pointer-events: none;
  opacity: 0;
  transition: opacity 0.2s ease;
}

.event-tooltip.active {
  opacity: 1;
}

.event-tooltip h3 {
  margin: 0 0 0.5rem 0;
  font-size: 1.6em;
  color: var(--md-primary-fg-color);
}

.event-tooltip p {
  margin: 0.3rem 0;
  font-size: 1.3em;
}

.event-tooltip time {
  display: block;
  color: var(--md-default-fg-color--light);
  font-size: 1.1em;
}
/* Estilos integrados ao Material Theme */
.fc-event {
  cursor: pointer;
  transition: transform 0.2s ease;
}

.fc-event:hover {
  transform: translateY(-1px);
  z-index: 100;
}
.fc {
  --fc-border-color: var(--md-default-fg-color--lightest);
  --fc-page-bg-color: var(--md-default-bg-color);
  --fc-today-bg-color: var(--md-default-fg-color--lightest);
  font-family: var(--md-text-font-family);
}

.fc-toolbar-title {
  color: var(--md-default-fg-color--light);
  font-weight: 500;
  font-size: 1.25em;
}

.fc-button {
  background-color: var(--md-primary-fg-color) !important;
  border-color: var(--md-primary-fg-color) !important;
  color: var(--md-primary-bg-color) !important;
  border-radius: 2px;
  text-transform: none;
  box-shadow: var(--md-shadow-z1);
  transition: opacity 0.3s;
}

.fc-button:hover {
  opacity: 0.8;
}

.fc-event {
  
  border-color: transparent;
  
  border-radius: 2px;
  font-size: 0.8em;
  padding: 2px 6px;
  margin: 2px 0;
}

.md-calendar-loading {
  display: flex;
  justify-content: center;
  padding: 2rem;
}

.md-spinner {
  width: 2rem;
  height: 2rem;
  border: 0.25em solid var(--md-default-fg-color--lightest);
  border-top-color: var(--md-primary-fg-color);
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

.md-calendar-error {
  color: var(--md-typeset-a-color);
  padding: 1rem;
  border-radius: 0.2rem;
  background-color: var(--md-error-bg-color);
}
</style>


<script>
  document.addEventListener('DOMContentLoaded', function () {
    const tooltip = document.createElement('div');
    tooltip.className = 'event-tooltip';
    document.body.appendChild(tooltip);
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'pt',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'multiMonthYear,dayGridMonth,listWeek,timeGridDay'
      },
      views: {
        listWeek: {
          buttonText: 'Lista'
        },
        dayGridMonth: {
          buttonText: 'Mês'
        },
        timeGridDay: {
          buttonText: 'Dia'
        },
        multiMonthYear: {
          buttonText: 'Ano'
        }
      },
      fixedWeekCount: false,
      contentHeight: 'auto',
      editable: false,
      eventLimit: true,

      eventSources: [
        {
          url: '../assets/calendar/aqw.json', 
          failure: () => alert('Falha ao carregar aqw.json')
        }
      ],

      eventDidMount: function(info) {
        
        const title = info.event.title.toLowerCase();
        const icon = document.createElement('span');
        icon.style.marginRight = '6px';

        if (title.includes('double rep')) {
          icon.innerHTML = '';
        } else if (title.includes('double exp')) {
          icon.innerHTML = '';
        } else if (title.includes('double gold')) {
          icon.innerHTML = '';
        } else if (title.includes('double class point')) {
          icon.innerHTML = '';
        }

        if (icon.innerHTML !== '') {
          info.el.querySelector('.fc-event-title')?.prepend(icon);
        }      
      
      // Tooltip hover
      const element = info.el;
      
      element.addEventListener('mouseenter', (e) => {
        const event = info.event;
        const start = event.start?.toLocaleDateString('pt-BR', {
          day: 'numeric',
          month: 'short',
          year: 'numeric',
          hour: '2-digit',
          minute: '2-digit'
        });
        
        const end = event.end?.toLocaleDateString('pt-BR', {
          day: 'numeric',
          month: 'short',
          year: 'numeric',
          hour: '2-digit',
          minute: '2-digit'
        });

        tooltip.innerHTML = `
          <h3>${event.title}</h3>
          ${event.extendedProps.description ? `<p>${event.extendedProps.description}</p>` : ''}
          <time>🏁 Início: ${start}</time>
          ${end ? `<time>🏳️ Término: ${end}</time>` : ''}
        `;

        // Posicionamento do tooltip
        const rect = element.getBoundingClientRect();
        tooltip.style.left = `${rect.left + window.scrollX}px`;
        tooltip.style.top = `${rect.top + window.scrollY - tooltip.offsetHeight - 10}px`;
        tooltip.classList.add('active');
      });

      element.addEventListener('mouseleave', () => {
        tooltip.classList.remove('active');
      });
    }
  });

    calendar.render();
  });
</script>