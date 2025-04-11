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

<div id='calendar'></div>

<div id="calendar">
  <div class="md-calendar-error" hidden></div>
</div>

<style>
/* Estilos integrados ao Material Theme */
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
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'listWeek',
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
          icon.innerHTML = '🟢';
        } else if (title.includes('double exp')) {
          icon.innerHTML = '🟣';
        } else if (title.includes('double gold')) {
          icon.innerHTML = '🟡';
        } else if (title.includes('double class point')) {
          icon.innerHTML = '🟥';
        }

        if (icon.innerHTML !== '') {
          info.el.querySelector('.fc-event-title')?.prepend(icon);
        }
      }
    });

    calendar.render();
  });
</script>