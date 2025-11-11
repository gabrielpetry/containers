FROM apache/superset:5.0.0

USER root

# Install packages using uv into the virtual environment
RUN . /app/.venv/bin/activate && \
    uv pip install \
    # install psycopg2 for using PostgreSQL metadata store - could be a MySQL package if using that backend:
    psycopg2-binary \
    # openpyxl to be able to upload Excel files
    openpyxl \
    # Pillow for Alerts & Reports to generate PDFs of dashboards
    Pillow \
    # trino
    trino

# Switch back to the superset user
USER superset

CMD ["/app/docker/entrypoints/run-server.sh"]
