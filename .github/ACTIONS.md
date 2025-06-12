# Baneronetwo CLI GitHub Action

Эта документация описывает, как использовать Baneronetwo CLI в качестве GitHub Action в ваших workflow.

## Использование

Вы можете использовать Baneronetwo CLI Action в своих workflow следующим образом:

```yaml
steps:
  - name: Checkout repository
    uses: actions/checkout@v3

  - name: Run Baneronetwo CLI
    uses: BANSAFAn/CLI-Baneronetwo@main
    with:
      format: 'text'  # Опционально: text, json, markdown
      username: 'custom-user'  # Опционально: имя пользователя
```

## Входные параметры

| Параметр | Описание | Обязательный | По умолчанию |
|----------|----------|--------------|---------------|
| `format` | Формат вывода (text, json, markdown) | Нет | `text` |
| `username` | Имя пользователя для отображения | Нет | Текущий пользователь |

## Выходные параметры

| Параметр | Описание |
|----------|----------|
| `result` | Форматированный вывод команды CLI |

## Примеры использования

### Базовое использование

```yaml
steps:
  - name: Checkout repository
    uses: actions/checkout@v3

  - name: Run Baneronetwo CLI
    uses: BANSAFAn/CLI-Baneronetwo@main
```

### Использование с пользовательскими параметрами

```yaml
steps:
  - name: Checkout repository
    uses: actions/checkout@v3

  - name: Run Baneronetwo CLI
    uses: BANSAFAn/CLI-Baneronetwo@main
    with:
      format: 'json'
      username: 'github-actions'
```

### Использование вывода в последующих шагах

```yaml
steps:
  - name: Checkout repository
    uses: actions/checkout@v3

  - name: Run Baneronetwo CLI
    id: baneronetwo
    uses: BANSAFAn/CLI-Baneronetwo@main
    with:
      format: 'json'

  - name: Use output
    run: |
      echo "Результат: ${{ steps.baneronetwo.outputs.result }}"
      # Если формат JSON, можно использовать fromJSON
      # echo "YouTube: ${{ fromJSON(steps.baneronetwo.outputs.result).youtube }}"
```

## Полный пример workflow

Пример полного workflow можно найти в [.github/workflows/action-test.yml](https://github.com/BANSAFAn/CLI-Baneronetwo/blob/main/.github/workflows/action-test.yml).

## Использование в различных операционных системах

Action автоматически определяет операционную систему и использует соответствующий скрипт (PowerShell для Windows, Bash для Linux/macOS).

```yaml
jobs:
  run-on-multiple-os:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Run Baneronetwo CLI
        uses: BANSAFAn/CLI-Baneronetwo@main
```

## Устранение неполадок

Если у вас возникли проблемы с использованием Action, проверьте следующее:

1. Убедитесь, что вы используете правильную ссылку на репозиторий (`BANSAFAn/CLI-Baneronetwo@main`)
2. Проверьте, что скрипты `baneronetwo.sh` и `baneronetwo.ps1` существуют в репозитории
3. Проверьте логи выполнения Action для получения дополнительной информации об ошибках

## Лицензия

BSD 3-Clause License. См. файл [LICENSE](../LICENSE) для получения дополнительной информации.